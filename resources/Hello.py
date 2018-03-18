def f(x):
    """Syntax Highlighting Demo
    @param x Parameter

    Semantic highlighting:
    Generated spectrum to pick colors for local variables and parameters:
    Color#1 SC1.1 SC1.2 SC1.3 SC1.4 Color#2 SC2.1 SC2.2 SC2.3 SC2.4 Color#3
    Color#3 SC3.1 SC3.2 SC3.3 SC3.4 Color#4 SC4.1 SC4.2 SC4.3 SC4.4 Color#5
    """
    s = ("Test", 2 + 3, {'a': 'b'}, x)  # Comment
    if s is not None:
        f(s[0].lower())

class Foo:
    tags: List[str]
    def __init__(self):
        byte_string = 'newline:\n also newline:\x0a'
        text_string = "Cyrillic R is \u042f."
        self.makeSense(whatever=1)
    
    def make_sense(self, whatever):
        self.sense = whatever

x = len('abc')
print(f.__doc__)