import sys

import generators as gens
import os

def refreshPolybar():
    os.system("wmname bspwm")
    os.system("killall polybar")
    os.system("al-polybar-session -z ~/.config/polybar/sessions/custom-sessionfile")
    os.system("wmname LG3D")

def refreshKitty(kittyGenerator):
    os.system(f"kitty @ set-colors --all {kittyGenerator.file_out}")

def refresh(gen_instances):
    refreshPolybar()
    refreshKitty(gen_instances["kitty"])
    os.system("rcup")

def main():
    if len(sys.argv) != 2:
        return
    gen_classes = {
        "polybar": gens.PolybarColorGenerator,
        "kitty": gens.KittyColorGenerator,
    }
    gen_instances = {}
    for key, gen_class in gen_classes.items():
        gen = gen_class(sys.argv[1])
        gen_instances[key] = gen
        gen.generate()
    refresh(gen_instances)

main()

