config.load_autoconfig()

c.tabs.background = True
c.new_instance_open_target = 'window'
c.downloads.position = 'bottom'
c.spellcheck.languages = ['en-GB']

config.bind(',ce', 'config-edit')
config.bind(',p', 'config-cycle -p content.plugins ;; reload')

#config.bind(',rta', 'open {url}top/?sort=top&t=all')
#config.bind(',rtv', 'spawn termite -e "rtv {url}"')
#config.bind(',c', 'spawn -d chromium {url}')

c.fonts.tabs.selected = '10pt Jetbrains Mono'
c.fonts.tabs.unselected = '10pt Jetbrains Mono'
c.fonts.statusbar = '8pt Jetbrains Mono'
c.fonts.web.family.fantasy = 'Noto Sans'

c.search.incremental = False
c.editor.command = ['vim', '{}']

#c.qt.args = ['ppapi-widevine-path=/usr/lib/qt/plugins/ppapi/libwidevinecdmadapter.so']

config.source('gruvbox.py')
