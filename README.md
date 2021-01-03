# GulpeaseAction
GitHub Action for evaluating the Gulpease index for documents written in Italian

# Aspected inputs
`directory:<where the pdf files are stored>`

# Output
In the chosen directory will be a directory named Gulpease that contains fileName-eval.txt for each of the pdf checked

# Example
```yaml
name: spellCheck

on:[push]
jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - name: Checkout repository contents
      uses: actions/checkout@v1

    - name: spellCheck
      uses: Jatus93/GulpeaseAction@master
      with:
        directory: <where the pdf files are stored>
    
    - name: upload artifact
      uses: actions/upload-artifact@v1
      with:
        name: Documents
        path: <where the pdf files are stored>
```

_Repository opportunamente modificata per monitorare la documentazione del seguente progetto:_ <https://github.com/CodeOfDutyJS/documentazione>
