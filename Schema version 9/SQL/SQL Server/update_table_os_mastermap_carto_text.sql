UPDATE [dbo].[OS_MASTERMAP_CARTO_TEXT] SET STYLE_DESCRIPTION =
CASE
  WHEN CHARINDEX('Buildings Or Structure', DescriptiveGroup) > 0 THEN 'Building Text'
  WHEN CHARINDEX('Inland Water', DescriptiveGroup) > 0 THEN 'Water Text'
  WHEN CHARINDEX('Road Or Track', DescriptiveGroup) > 0 THEN 'Road Text'
  WHEN DescriptiveGroup = 'Terrain and Height' THEN 'Height Text'
  WHEN CHARINDEX('Roadside', DescriptiveGroup) > 0 THEN 'Roadside Text'
  WHEN CHARINDEX('Structure', DescriptiveGroup) > 0 THEN 'Structure Text'
  WHEN DescriptiveGroup = 'Political Or Administrative' THEN 'Administrative Text'
  WHEN DescriptiveGroup = 'General Surface' AND Make = 'Natural' THEN 'General Surface Natural Text'
  WHEN DescriptiveGroup = 'General Surface' AND Make = 'Manmade' OR DescriptiveGroup = 'General Surface' AND Make IS NULL THEN 'General Surface Manmade Text'
  WHEN DescriptiveGroup = 'Landform' AND Make = 'Natural' THEN 'Landform Natural Text'
  WHEN DescriptiveGroup = 'Foreshore' THEN 'Foreshore Text'
  WHEN CHARINDEX('Tidal Water', DescriptiveGroup) > 0 THEN 'Tidal Water Text'
  WHEN DescriptiveGroup = 'Built Environment' THEN 'Built Environment Text'
  WHEN CHARINDEX('Historic Interest', DescriptiveGroup) > 0 THEN 'Historic Text'
  WHEN DescriptiveGroup = 'Rail' THEN 'Rail Text'
  WHEN CHARINDEX('General Feature', DescriptiveGroup) > 0 THEN 'General Feature Text'
  WHEN DescriptiveGroup = 'Landform' AND Make = 'Manmade' THEN 'Landform Manmade Text'
  ELSE 'Unclassified'
END,
STYLE_CODE =
CASE
  WHEN CHARINDEX('Buildings Or Structure', DescriptiveGroup) > 0 THEN 1
  WHEN CHARINDEX('Inland Water', DescriptiveGroup) > 0 THEN 2
  WHEN CHARINDEX('Road Or Track', DescriptiveGroup) > 0 THEN 3
  WHEN DescriptiveGroup = 'Terrain And Height' THEN 4
  WHEN CHARINDEX('Roadside', DescriptiveGroup) > 0 THEN 5
  WHEN CHARINDEX('Structure', DescriptiveGroup) > 0 THEN 6
  WHEN DescriptiveGroup = 'Political Or Administrative' THEN 7
  WHEN DescriptiveGroup = 'General Surface' AND Make = 'Natural' THEN 8
  WHEN DescriptiveGroup = 'General Surface' AND Make = 'Manmade' OR DescriptiveGroup = 'General Surface' AND Make IS NULL THEN 9
  WHEN DescriptiveGroup = 'Landform' AND Make = 'Natural' THEN 10
  WHEN DescriptiveTerm = 'Foreshore' THEN 11
  WHEN CHARINDEX('Tidal Water', DescriptiveGroup) > 0 THEN 12
  WHEN DescriptiveGroup = 'Built Environment' THEN 13
  WHEN CHARINDEX('Historic Interest', DescriptiveGroup) > 0 THEN 14
  WHEN DescriptiveGroup = 'Rail' THEN 15
  WHEN CHARINDEX('General Feature', DescriptiveGroup) > 0 THEN 16
  WHEN DescriptiveGroup = 'Landform' AND Make = 'Manmade' THEN 17
  ELSE 99
END,
COLOUR_CODE =
CASE
  WHEN CHARINDEX('Buildings Or Structure', DescriptiveGroup) > 0 THEN 1
  WHEN CHARINDEX('Inland Water', DescriptiveGroup) > 0 THEN 2
  WHEN CHARINDEX('Road Or Track', DescriptiveGroup) > 0 THEN 1
  WHEN DescriptiveGroup = 'Terrain And Height' THEN 3
  WHEN CHARINDEX('Roadside', DescriptiveGroup) > 0 THEN 1
  WHEN CHARINDEX('Structure', DescriptiveGroup) > 0 THEN 1
  WHEN DescriptiveGroup = 'Political Or Administrative' THEN 5
  WHEN DescriptiveGroup = 'General Surface' AND Make = 'Natural' THEN 1
  WHEN DescriptiveGroup = 'General Surface' AND Make = 'Manmade' OR DescriptiveGroup = 'General Surface' AND Make IS NULL THEN 1
  WHEN DescriptiveGroup = 'Landform' AND Make = 'Natural' THEN 4
  WHEN DescriptiveTerm = 'Foreshore' THEN 4
  WHEN CHARINDEX('Tidal Water', DescriptiveGroup) > 0 THEN 2
  WHEN DescriptiveGroup = 'Built Environment' THEN 1
  WHEN CHARINDEX('Historic Interest', DescriptiveGroup) > 0 THEN 1
  WHEN DescriptiveGroup = 'Rail' THEN 1
  WHEN CHARINDEX('General Feature', DescriptiveGroup) > 0 THEN 1
  WHEN DescriptiveGroup = 'Landform' AND Make = 'Manmade' THEN 4
  ELSE 1
END,
FONT_CODE =
CASE
WHEN CHARINDEX('Buildings Or Structure', DescriptiveGroup) > 0 THEN 1
WHEN CHARINDEX('Inland Water', DescriptiveGroup) > 0 THEN 2
WHEN CHARINDEX('Road Or Track', DescriptiveGroup) > 0 THEN 1
WHEN DescriptiveGroup = 'Terrain And Height' THEN 1
WHEN CHARINDEX('Roadside', DescriptiveGroup) > 0 THEN 1
WHEN CHARINDEX('Structure', DescriptiveGroup) > 0 THEN 1
WHEN DescriptiveGroup = 'Political Or Administrative' THEN 1
WHEN DescriptiveGroup = 'General Surface' AND Make = 'Natural' THEN 1
WHEN DescriptiveGroup = 'General Surface' AND Make = 'Manmade' OR DescriptiveGroup = 'General Surface' AND Make IS NULL THEN 1
WHEN DescriptiveGroup = 'Landform' AND Make = 'Natural' THEN 4
WHEN DescriptiveTerm = 'Foreshore' THEN 4
WHEN CHARINDEX('Tidal Water', DescriptiveGroup) > 0 THEN 2
WHEN DescriptiveGroup = 'Built Environment' THEN 1
WHEN CHARINDEX('Historic Interest', DescriptiveGroup) > 0 THEN 3
WHEN DescriptiveGroup = 'Rail' THEN 1
WHEN CHARINDEX('General Feature', DescriptiveGroup) > 0 THEN 1
WHEN DescriptiveGroup = 'Landform' AND Make = 'Manmade' THEN 1
ELSE 1
END,
ROTATION = (CAST(Orientation AS DECIMAL(6,1))/10), -- Casting Orientation from SmallInt to Decimal otherwise incorrect quotient
GEO_X =
CASE
  WHEN AnchorPosition = 0 THEN 0
  WHEN AnchorPosition = 1 THEN 0
  WHEN AnchorPosition = 2 THEN 0
  WHEN AnchorPosition = 3 THEN 0.5
  WHEN AnchorPosition = 4 THEN 0.5
  WHEN AnchorPosition = 5 THEN 0.5
  WHEN AnchorPosition = 6 THEN 1
  WHEN AnchorPosition = 7 THEN 1
  WHEN AnchorPosition = 8 THEN 1
END,
GEO_Y =
CASE
  WHEN AnchorPosition = 0 THEN 0
  WHEN AnchorPosition = 1 THEN 0.5
  WHEN AnchorPosition = 2 THEN 1
  WHEN AnchorPosition = 3 THEN 0
  WHEN AnchorPosition = 4 THEN 0.5
  WHEN AnchorPosition = 5 THEN 1
  WHEN AnchorPosition = 6 THEN 0
  WHEN AnchorPosition = 7 THEN 0.5
  WHEN AnchorPosition = 8 THEN 1
END,
ANCHOR =
CASE
  WHEN AnchorPosition = 0 THEN 'SW'
  WHEN AnchorPosition = 1 THEN 'W'
  WHEN AnchorPosition = 2 THEN 'NW'
  WHEN AnchorPosition = 3 THEN 'S'
  WHEN AnchorPosition = 4 THEN ' '
  WHEN AnchorPosition = 5 THEN 'N'
  WHEN AnchorPosition = 6 THEN 'SE'
  WHEN AnchorPosition = 7 THEN 'E'
  WHEN AnchorPosition = 8 THEN 'NE'
END;
