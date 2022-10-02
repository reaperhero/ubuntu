def a = "aaaaa"
def b = "bbbbb"


println("${a}" + "${b}")

def downloadSpec =
            '''{
            "files": [
                {
                    "pattern": "libs-snapshot-local/*.zip",
                    "target": "dependencies/",
                    "props": "p1=v1;p2=v2"
                }
            ]
        }'''
b = "ccc"

println(b)