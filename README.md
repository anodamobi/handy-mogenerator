# Handy mogenerator

Useful scripts to integrate mogenerator in Xcode run phases

## Usage

1. Download [latest ZIP](https://github.com/anodamobi/handy-mogenerator/archive/master.zip)

2. Unpack it, for example, to `./ProjectFolder/Vendor/handy-mogenerator/`

3. Add two custom run-phases to your project:

   * **Data model files**
     
     * Process: `Data model files`
     * Using: `Custom script:`
     * Script:
     
       ```
       echo "Running mogen"
       "${PROJECT_DIR}/Vendor/handy-mogenerator/mogen.sh"
       ```

   * **Data model version files**
     
     * Process: `Data model version files`
     * Using: `Custom script:`
     * Script:
     
       ```
       echo "Running mogend"
       "${PROJECT_DIR}/Vendor/handy-mogenerator/mogend.sh"
       ```

That's all Folks!

## Troubleshooting

Create issue here or mail me on [alex@anoda.mobi](mailto:alex@anoda.mobi)

## License

Copyright (c) 2013-2015 ANODA Mobile Development Agency http://anoda.mobi

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.