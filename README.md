# handy-mogenerator

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