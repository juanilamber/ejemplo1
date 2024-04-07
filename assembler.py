name: Build

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2
      
    - name: Assemble code
      run: python assembler.py ejemplo.asm
      
    - name: Save assembled code
      run: mv ejemplo.mem build/
