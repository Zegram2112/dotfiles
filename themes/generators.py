from utils import rootDirectory


class FileColorGenerator:

    def __init__(self, theme: str, file_in: str, file_out: str):
        root: str = rootDirectory()
        self.file_in = f"{root}/themes/colorschemes/{theme}/{file_in}"
        self.file_out = f"{root}/{file_out}"

    def generate(self) -> None:
        with open(self.file_in, "r") as fin:
            content = fin.read()
            with open(self.file_out, "w") as fout:
                fout.write(content)


class PolybarColorGenerator(FileColorGenerator):

    def __init__(self, theme: str = "one"):
        super().__init__(theme, "polybar.colors", "config/polybar/colors.conf.compiled")


class KittyColorGenerator(FileColorGenerator):

    def __init__(self, theme: str = "one"):
        super().__init__(theme, "kitty.colors", "config/kitty/colors.conf.compiled")

