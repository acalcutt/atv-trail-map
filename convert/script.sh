togeojson Line-Features_Maine.kml > Line-Features_Maine.geojson
togeojson Line-Features_New-Hampshire.kml > Line-Features_New-Hampshire.geojson
togeojson Line-Features_New-York.kml > Line-Features_New-York.geojson
togeojson Line-Features_Pennsylvania.kml > Line-Features_Pennsylvania.geojson
togeojson Line-Features_Vermont.kml > Line-Features_Vermont.geojson
togeojson Point-Features_Maine.kml > Point-Features_Maine.geojson
togeojson Point-Features_New-Hampshire.kml > Point-Features_New-Hampshire.geojson
togeojson Point-Features_New-York.kml > Point-Features_New-York.geojson
togeojson Point-Features_Pennsylvania.kml > Point-Features_Pennsylvania.geojson
togeojson Point-Features_Vermont.kml > Point-Features_Vermont.geojson
sed -i 's/<br><br>//g' *.geojson
#geojson-merge Line-Features_Maine.geojson Line-Features_New-York.geojson Line-Features_Vermont.geojson Line-Features_New-Hampshire.geojson Line-Features_Pennsylvania.geojson > combined_lines.geojson
#geojson-merge Line-Features_Maine.geojson Line-Features_New-York.geojson Line-Features_Vermont.geojson Line-Features_New-Hampshire.geojson Line-Features_Pennsylvania.geojson > combined_points.geojson
tippecanoe -z12 -o atv-trails.pmtiles -l atv-trails --drop-densest-as-needed --extend-zooms-if-still-dropping -A "<a href=""https://www.gpstrailmasters.com/"" target=""_blank"">&copy; GPS Trailmasters</a>" Line-Features_Maine.geojson Line-Features_New-Hampshire.geojson Line-Features_New-York.geojson Line-Features_Pennsylvania.geojson Line-Features_Vermont.geojson
tippecanoe -z12 -o atv-points.pmtiles -l atv-points --no-feature-limit --no-tile-size-limit -A "<a href=""https://www.gpstrailmasters.com/"" target=""_blank"">&copy; GPS Trailmasters</a>" Point-Features_Maine.geojson Point-Features_New-Hampshire.geojson Point-Features_New-York.geojson Point-Features_Pennsylvania.geojson Point-Features_Vermont.geojson
#/opt/route_snapper/osm-to-route-snapper# cargo run --release -- -i /opt/gpstrailmasters/combined.osm.xml
