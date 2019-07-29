from pathlib import Path


def rootDirectory() -> str:
    return str(Path.home()) + "/dotfiles"
