FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-Fixed-chromium-flicker-with-g2d-renderer.patch"

GN_ARGS_DISABLE_GBM     = ""
GN_ARGS_DISABLE_GBM_mx6 = "use_system_minigbm=false use_wayland_gbm=false"
GN_ARGS_DISABLE_GBM_mx7 = "${GN_ARGS_DISABLE_GBM_mx6}"
GN_ARGS += "${GN_ARGS_DISABLE_GBM}"

CHROMIUM_EXTRA_ARGS_append = " --disable-features=VizDisplayCompositor --in-process-gpu"
