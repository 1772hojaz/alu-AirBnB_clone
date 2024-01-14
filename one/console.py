#!/usr/bin/python3
import cmd


class HBnB(cmd.Cmd):
    prompt = "(hbnb) "

    def do_quit(self, arg):
        """exit this console"""
        return True


if __name__ == '__main__':
    my_cmd = HBnB()
    my_cmd.cmdloop()
