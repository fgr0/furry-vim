let g:furry_settings = {}
let s:furry_settings.plugin_groups = []

" Setup all Plugingroups {{{
    call add(s:furry_settings.plugin_groups, 'core')
    call add(s:furry_settings.plugin_groups, 'colors')
    call add(s:furry_settings.plugin_groups, 'editing')
    call add(s:furry_settings.plugin_groups, 'autocompletion')
    call add(s:furry_settings.plugin_groups, 'unite')
    call add(s:furry_settings.plugin_groups, 'development')
    call add(s:furry_settings.plugin_groups, 'scm')
    call add(s:furry_settings.plugin_groups, 'markup')
    call add(s:furry_settings.plugin_groups, 'latex')
    call add(s:furry_settings.plugin_groups, 'web')
    call add(s:furry_settings.plugin_groups, 'python')
    call add(s:furry_settings.plugin_groups, 'go')
    call add(s:furry_settings.plugin_groups, 'osx')
    call add(s:furry_settings.plugin_groups, 'java')
    call add(s:furry_settings.plugin_groups, 'misc')
"}}}
