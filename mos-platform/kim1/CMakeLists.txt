platform(kim1 COMPLETE HOSTED PARENT commodore)

if(NOT CMAKE_CROSSCOMPILING)
  return()
endif()

install(FILES
  kim1.h
TYPE INCLUDE)
install(FILES link.ld TYPE LIB)

add_platform_library(kim1-crt0)
merge_libraries(kim1-crt0
  common-init-stack
  common-crt0
  common-copy-zp-data
  common-zero-bss
  common-exit-loop

)

install(FILES kim1.inc DESTINATION ${ASMINCDIR})

add_platform_library(kim1-c
  #write.s
  #tapeio.s
  scandisplay.c
  #read.s
  #getkey.s
)

target_include_directories(kim1-c BEFORE PUBLIC .)
