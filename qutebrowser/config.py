config.load_autoconfig()

c.tabs.background = True
c.new_instance_open_target = 'window'
c.downloads.position = 'bottom'
#c.spellcheck.languages = ['en-GB']

config.unbind('<Alt-1>')
config.unbind('<Alt-2>')
config.unbind('<Alt-3>')
config.unbind('<Alt-4>')
config.unbind('<Alt-5>')
config.unbind('<Alt-6>')
config.unbind('<Alt-7>')
config.unbind('<Alt-8>')
config.unbind('<Alt-9>')
config.bind(',ce', 'config-edit')
config.bind(',p', 'config-cycle -p content.plugins ;; reload')
config.bind('<Ctrl-1>', 'tab-focus 1')
config.bind('<Ctrl-2>', 'tab-focus 2')
config.bind('<Ctrl-3>', 'tab-focus 3')
config.bind('<Ctrl-4>', 'tab-focus 4')
config.bind('<Ctrl-5>', 'tab-focus 5')
config.bind('<Ctrl-6>', 'tab-focus 6')
config.bind('<Ctrl-7>', 'tab-focus 7')
config.bind('<Ctrl-8>', 'tab-focus 8')
config.bind('<Ctrl-9>', 'tab-focus 9')
config.bind('<Ctrl-0>', 'tab-focus 10')
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
c.content.javascript.enabled = False
config.source('gruvbox.py')
