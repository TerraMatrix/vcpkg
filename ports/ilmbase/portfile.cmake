# IlmBase is now part of Imath. This is a compatibility port.
# The actual implementation is provided by the imath port.

set(VCPKG_POLICY_EMPTY_PACKAGE enabled)

if("tools" IN_LIST FEATURES)
    message(WARNING "Tools feature is not supported by the ilmbase compatibility package")
endif()