
# Remove a given "User" enviromental variable
function Unset-EnvVar ($env_var, $verbose=$TRUE) {
  if(-Not [string]::IsNullOrEmpty([System.Environment]::GetEnvironmentVariable($env_var, $scope))) {
    if ($verbose) {
      Write-Host "unset $env_var"  # from scope $scope
    }
    [System.Environment]::SetEnvironmentVariable($env_var, $null, $scope);
  }
}

# Remove an item from a given env var
function Remove-ItemFromEnvVar ($env_var, $item, $verbose=$True) {
  $currVar = [System.Environment]::GetEnvironmentVariable($env_var, $scope);
  # If the env variable is already empty, do nothing
  if (-Not [string]::IsNullOrEmpty($currVar)) {
    $items = $currVar.Split(';')  
    if($items -contains $item) {
      $newVar = ($items | Where-Object { $_ -ne $item }) -join ';';
      # If the resulting final variable is empty, delete the environment var
      if ([string]::IsNullOrEmpty($newVar)) {
        if ($verbose) {
          Write-Host "remove empty '$env_var'" # in scope $scope
        }    
        [System.Environment]::SetEnvironmentVariable($env_var, $null, $scope);
      } else {
        if ($verbose) {
          Write-Host "remove '$item' from $env_var" # in scope $scope
        }    
        [System.Environment]::SetEnvironmentVariable($env_var, $newVar, $scope);
      }
    }
  }
}


# Set a value to a given enviromental variable
function Set-EnvVar ($env_var, $value, $verbose=$True) {
  if ($verbose) {
    Write-Host "set $env_var = $value"
  }
  [System.Environment]::SetEnvironmentVariable($env_var, $value, $scope);
}

# Append an item to a given env var
function Add-ItemToEnvVar($env_var, $item, $append=$True, $verbose=$True) {
  $currVar = [System.Environment]::GetEnvironmentVariable($env_var, $scope);  
  if ([string]::IsNullOrEmpty($currVar)) {
    # If the enviromental variable is currently empty, do not add an initial ";"
    if ($Verbose) {
      Write-Host "add $env_var with '$item'"
    }
    $newVar = $item;    
  } else {
    $items = $currVar.Split(';')  
    if($items -contains $item) {
      return  # ensure idempotency
    }
    if($append) {
      $sep = ';'
      if($currVar[$currVar.length-1] -eq ';') {
        $sep = ''
      }
      Write-Host "append '$item' to $env_var separator=$sep"
      $newVar = $currVar + $sep + $item
    }
    else {
      Write-Host "insert '$item' in front of $env_var"
      $newVar = $item + ';' + $currVar;
    }
  }
  [System.Environment]::SetEnvironmentVariable($env_var, $newVar, $scope);
}