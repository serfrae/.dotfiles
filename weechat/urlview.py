import distutils.spawn
import os
import pipes
import weechat


def urlview(data, buf, args):
    infolist = weechat.infolist_get("buffer_lines", buf, "")
    lines = []
    while weechat.infolist_next(infolist) == 1:
        lines.append(
            weechat.string_remove_color(
                weechat.infolist_string(infolist, "message"),
                ""
            )
        )

    weechat.infolist_free(infolist)

    if not lines:
        weechat.prnt(buf, "No URLs found")
        return weechat.WEECHAT_RC_OK

    if not weechat.config_is_set_plugin("command"):
        weechat.config_set_plugin("command", "urlview")
    command = weechat.config_get_plugin("command")

    text = "\n".join(reversed(lines))
    response = os.system("echo %s | %s" % (pipes.quote(text), command))
    if response != 0:
        weechat.prnt(buf, "No URLs found")

    weechat.command(buf, "/window refresh")

    return weechat.WEECHAT_RC_OK


def main():
    if distutils.spawn.find_executable("urlview") is None:
        return weechat.WEECHAT_RC_ERROR

if __name__ == "__main__":
    main()
