        add_library(Qhull::qhull_r IMPORTED INTERFACE)
        set_target_properties(Qhull::qhull_r PROPERTIES INTERFACE_LINK_LIBRARIES Qhull::qhullstatic_r)
