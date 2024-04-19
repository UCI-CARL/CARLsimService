cmake_minimum_required(VERSION 3.20)

project(Service VERSION 0.1)

add_library(Service INTERFACE CARLsimPP-service.hpp) 

install(TARGETS Service
        EXPORT Service
        PUBLIC_HEADER
        DESTINATION include
        COMPONENT Core)  
        
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/config DESTINATION ${CMAKE_INSTALL_PREFIX})        

install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/check DESTINATION ${CMAKE_INSTALL_PREFIX})        
        