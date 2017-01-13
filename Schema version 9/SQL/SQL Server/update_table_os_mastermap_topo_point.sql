UPDATE [dbo].[OS_MASTERMAP_TOPO_POINT] SET STYLE_DESCRIPTION =
CASE
  -- Descriptive Group Rules
  WHEN CHARINDEX('Inland Water', DescriptiveGroup) > 0 THEN 'Inland Water Point'
  WHEN CHARINDEX('Roadside', DescriptiveGroup) > 0 THEN 'Roadside Point'
  WHEN CHARINDEX('Rail', DescriptiveGroup) > 0 THEN 'Rail Point'
  WHEN CHARINDEX('Tidal Water', DescriptiveGroup) > 0 THEN 'Tidal Water Point'
  WHEN CHARINDEX('Structure', DescriptiveGroup) > 0 THEN 'Structure Point'
  WHEN DescriptiveGroup = 'Landform' THEN 'Landform Point'
  WHEN DescriptiveGroup = 'Historic Interest' THEN 'Historic Point'
  WHEN CHARINDEX('Site Of Heritage', DescriptiveTerm) > 0 THEN 'Site Of Heritage Point'
  WHEN CHARINDEX('Culvert', DescriptiveTerm) > 0 THEN 'Culvert Point'
  WHEN CHARINDEX('Overhead Construction', DescriptiveTerm) > 0 THEN 'Overhead Construction Point'
  -- Descriptive Term Rules
  WHEN DescriptiveTerm = 'Spot Height' THEN 'Spot Height Point'
  WHEN DescriptiveTerm = 'Emergency Telephone' THEN 'Emergency Telephone Point'
  WHEN DescriptiveTerm = 'Positioned Nonconiferous Tree' THEN 'Positioned Nonconiferous Tree Point'
  WHEN DescriptiveTerm = 'Positioned Coniferous Tree' THEN 'Positioned Coniferous Tree Point'
  WHEN DescriptiveTerm = 'Boundary Post Or Stone' THEN 'Boundary Post Point'
  WHEN DescriptiveTerm = 'Triangulation Point Or Pillar' THEN 'Triangulation Point Or Pillar Point'
  -- Rules Based on Feature Code
  WHEN FeatureCode = 10051 THEN 'Positioned Boulder Point'
  WHEN FeatureCode = 10100 THEN 'Disused Feature Point'
  WHEN FeatureCode = 10159 AND DescriptiveTerm = 'Switch' THEN 'Rail Switch Point'
  WHEN (FeatureCode = 10120 OR FeatureCode = 10176 OR FeatureCode = 10159) THEN 'Inland Water Point'
  ELSE 'Unclassified'
END,
STYLE_CODE =
CASE
  WHEN DescriptiveTerm = 'Spot Height' THEN 1
  WHEN DescriptiveTerm = 'Emergency Telephone' THEN 2
  WHEN CHARINDEX('Site Of Heritage', DescriptiveTerm) > 0 THEN 3
  WHEN CHARINDEX('Culvert', DescriptiveTerm) > 0 THEN 4
  WHEN DescriptiveTerm = 'Positioned Nonconiferous Tree' THEN 5
  WHEN CHARINDEX('Inland Water', DescriptiveGroup) > 0 THEN 6
  WHEN CHARINDEX('Roadside', DescriptiveGroup) > 0 THEN 7
  WHEN CHARINDEX('Overhead Construction', DescriptiveTerm) > 0 THEN 8
  WHEN CHARINDEX('Rail', DescriptiveGroup) > 0 THEN 9
  WHEN DescriptiveTerm = 'Positioned Coniferous Tree' THEN 10
  WHEN DescriptiveTerm = 'Boundary Post Or Stone' THEN 11
  WHEN DescriptiveTerm = 'Triangulation Point Or Pillar' THEN 12
  WHEN DescriptiveGroup = 'Historic Interest' THEN 13
  WHEN DescriptiveGroup = 'Landform' THEN 14
  WHEN CHARINDEX('Tidal Water', DescriptiveGroup) > 0 THEN 15
  WHEN CHARINDEX('Structure', DescriptiveGroup) > 0 THEN 16
  ELSE 99
END;
