UPDATE [dbo].[OS_MASTERMAP_TOPO_AREA] SET STYLE_DESCRIPTION =
CASE
  -- Built Environment Descriptive Term Rules
  WHEN DescriptiveTerm = 'Multi Surface' THEN 'Multi Surface Fill'
  WHEN DescriptiveTerm = 'Archway' THEN 'Archway Fill'
  WHEN CHARINDEX('Bridge', DescriptiveTerm) > 0 AND (CHARINDEX('Road Or Trac', DescriptiveGroup) > 0 OR CHARINDEX('Roadside', DescriptiveGroup) > 0) THEN 'Road Bridge Fill'
  WHEN CHARINDEX('Bridge', DescriptiveTerm) > 0 AND CHARINDEX('Rail', DescriptiveGroup) > 0 THEN 'Rail Bridge Fill'
  WHEN CHARINDEX('Bridge', DescriptiveTerm) > 0 THEN 'Bridge Fill'
  WHEN CHARINDEX('Level Crossing', DescriptiveTerm) > 0 THEN 'Level Crossing Fill'
  WHEN DescriptiveTerm = 'Traffic Calming' THEN 'Traffic Calming Fill'
  WHEN DescriptiveTerm = 'Pylon' THEN 'Pylon Fill'
  WHEN DescriptiveTerm = 'Track' THEN 'Track Fill'
  WHEN DescriptiveTerm = 'Step' THEN 'Step Fill'
  WHEN CHARINDEX('Canal', DescriptiveTerm) > 0 THEN 'Canal Fill'
  WHEN CHARINDEX('Footbridge', DescriptiveTerm) > 0 THEN 'Footbridge Fill'
  -- Natural Environment Descriptive Term Rules
  WHEN (CHARINDEX('Nonconiferous Trees,Coniferous Trees', DescriptiveTerm) > 0 OR CHARINDEX('Nonconiferous Trees (Scattered),Coniferous Trees (Scattered)', DescriptiveTerm) > 0) AND (CHARINDEX('Coniferous Trees,Nonconiferous Trees', DescriptiveTerm) > 0 OR CHARINDEX('Coniferous Trees (Scattered),Nonconiferous Trees (Scattered)', DescriptiveTerm) > 0) THEN 'Mixed Woodland Fill'
  --WHEN DescriptiveTerm IN ('Nonconiferous Trees,Coniferous Trees','Nonconiferous Trees (Scattered),Coniferous Trees (Scattered)','Coniferous Trees,Nonconiferous Trees','Coniferous Trees (Scattered),Nonconiferous Trees (Scattered)') THEN 'Mixed Woodland Fill'
  WHEN CHARINDEX('Nonconiferous Trees', DescriptiveTerm) > 0 OR CHARINDEX('Nonconiferous Trees (Scattered)', DescriptiveTerm) > 0 THEN 'Nonconiferous Tree Fill'
  WHEN CHARINDEX('Coniferous Trees', DescriptiveTerm) > 0 OR CHARINDEX('Coniferous Trees (Scattered)', DescriptiveTerm) > 0 THEN 'Coniferous Tree Fill'
  WHEN CHARINDEX('Agricultural Land', DescriptiveTerm) > 0 THEN 'Agricultural Land Fill'
  WHEN CHARINDEX('Orchard', DescriptiveTerm) > 0 THEN 'Orchard Fill'
  WHEN CHARINDEX('Coppice Or Osiers', DescriptiveTerm) > 0 THEN 'Coppice Or Osiers Fill'
  WHEN CHARINDEX('Scrub', DescriptiveTerm) > 0 THEN 'Scrub Fill'
  WHEN CHARINDEX('Boulders', DescriptiveTerm) > 0 OR CHARINDEX('Boulders (Scattered)', DescriptiveTerm) > 0 THEN 'Boulders Fill'
  WHEN CHARINDEX('Rock', DescriptiveTerm) > 0 OR CHARINDEX('Rock (Scattered)', DescriptiveTerm) > 0 THEN 'Rock Fill'
  WHEN CHARINDEX('Scree', DescriptiveTerm) > 0 THEN 'Scree Fill'
  WHEN CHARINDEX('Rough Grassland', DescriptiveTerm) > 0 THEN 'Rough Grassland Fill'
  WHEN CHARINDEX('Heath', DescriptiveTerm) > 0 THEN 'Heath Fill'
  WHEN CHARINDEX('Marsh Reeds Or Saltmarsh', DescriptiveTerm) > 0 OR CHARINDEX('Saltmarsh', DescriptiveTerm) > 0 THEN 'Marsh Fill'
  WHEN CHARINDEX('Sand', DescriptiveTerm) > 0 THEN 'Sand Fill'
  WHEN CHARINDEX('Mud', DescriptiveTerm) > 0 THEN 'Mud Fill'
  WHEN CHARINDEX('Shingle', DescriptiveTerm) > 0 THEN 'Shingle Fill'
  WHEN CHARINDEX('Marsh', DescriptiveTerm) > 0 THEN 'Marsh Fill'
  WHEN CHARINDEX('Reeds', DescriptiveTerm) > 0 THEN 'Reeds Fill'
  WHEN CHARINDEX('Foreshore', DescriptiveTerm) > 0 THEN 'Foreshore Fill'
  WHEN DescriptiveTerm = 'Slope' THEN 'Slope Fill'
  WHEN DescriptiveTerm = 'Cliff' THEN 'Cliff Fill'
  -- Descriptive Group Rules
  WHEN CHARINDEX('Building', DescriptiveGroup) > 0 THEN 'Building Fill'
  WHEN CHARINDEX('General Surface', DescriptiveGroup) > 0 AND Make = 'Natural' THEN 'Natural Fill'
  WHEN CHARINDEX('General Surface', DescriptiveGroup) > 0 AND (Make = 'Manmade' OR Make = 'Unknown') THEN 'Manmade Fill'
  WHEN CHARINDEX('Road Or Track', DescriptiveGroup) > 0 AND Make = 'Manmade' THEN 'Road Or Track Fill'
  WHEN CHARINDEX('Roadside', DescriptiveGroup) > 0 AND Make = 'Natural' THEN 'Roadside Natural Fill'
  WHEN CHARINDEX('Roadside', DescriptiveGroup) > 0 AND (Make = 'Manmade' OR Make = 'Unknown') THEN 'Roadside Manmade Fill'
  WHEN CHARINDEX('Inland Water', DescriptiveGroup) > 0 THEN 'Inland Water Fill'
  WHEN CHARINDEX('Path', DescriptiveGroup) > 0 THEN 'Path Fill'
  WHEN CHARINDEX('Rail', DescriptiveGroup) > 0 AND (Make = 'Manmade' OR Make = 'Unknown') THEN 'Rail Manmade Fill'
  WHEN CHARINDEX('Rail', DescriptiveGroup) > 0 AND Make = 'Natural' THEN 'Rail Natural Fill'
  WHEN CHARINDEX('Structure', DescriptiveGroup) > 0 THEN 'Structure Fill'
  WHEN CHARINDEX('Glasshouse', DescriptiveGroup) > 0 THEN 'Glasshouse Fill'
  WHEN CHARINDEX('Landform', DescriptiveGroup) > 0 AND Make = 'Natural' THEN 'Landform Natural Fill'
  WHEN CHARINDEX('Tidal Water', DescriptiveGroup) > 0 THEN 'Tidal Water Fill'
  WHEN CHARINDEX('Landform', DescriptiveGroup) > 0 AND Make = 'Manmade' THEN 'Landform Manmade Fill'
  ELSE 'Unclassified'
END,
STYLE_CODE =
CASE
  -- Built Environment Descriptive Term Rules
  WHEN DescriptiveTerm = 'Multi Surface' THEN 1
  WHEN DescriptiveTerm = 'Archway' THEN 2
  WHEN CHARINDEX('Bridge', DescriptiveTerm) > 0 AND (CHARINDEX('Road Or Track', DescriptiveGroup) > 0 OR CHARINDEX('Roadside', DescriptiveGroup) > 0) THEN 3
  WHEN CHARINDEX('Bridge', DescriptiveTerm) > 0 AND CHARINDEX('Rail', DescriptiveGroup) > 0 THEN 4
  WHEN CHARINDEX('Bridge', DescriptiveTerm) > 0 THEN 5
  WHEN CHARINDEX('Level Crossing', DescriptiveTerm) > 0 THEN 6
  WHEN DescriptiveTerm = 'Traffic Calming' THEN 7
  WHEN DescriptiveTerm = 'Pylon' THEN 8
  WHEN DescriptiveTerm = 'Track' THEN 9
  WHEN DescriptiveTerm = 'Step' THEN 10
  WHEN CHARINDEX('Canal', DescriptiveTerm) > 0 THEN 11
  WHEN CHARINDEX('Footbridge', DescriptiveTerm) > 0 THEN 12
  -- Natural Environment Descriptive Term Rules
  WHEN (CHARINDEX('Nonconiferous Trees,Coniferous Trees', DescriptiveTerm) > 0 OR CHARINDEX('Nonconiferous Trees (Scattered),Coniferous Trees (Scattered)', DescriptiveTerm) > 0) AND (CHARINDEX('Coniferous Trees,Nonconiferous Trees', DescriptiveTerm) > 0 OR CHARINDEX('Coniferous Trees (Scattered),Nonconiferous Trees (Scattered)', DescriptiveTerm) > 0) THEN 13
  --WHEN DescriptiveTerm IN ('Nonconiferous Trees,Coniferous Trees','Nonconiferous Trees (Scattered),Coniferous Trees (Scattered)','Coniferous Trees,Nonconiferous Trees','Coniferous Trees (Scattered),Nonconiferous Trees (Scattered)') THEN 13
  WHEN CHARINDEX('Nonconiferous Trees', DescriptiveTerm) > 0 OR CHARINDEX('Nonconiferous Trees (Scattered)', DescriptiveTerm) > 0 THEN 14
  WHEN CHARINDEX('Coniferous Trees', DescriptiveTerm) > 0 OR CHARINDEX('Coniferous Trees (Scattered)', DescriptiveTerm) > 0 THEN 15
  WHEN CHARINDEX('Agricultural Land', DescriptiveTerm) > 0 THEN 16
  WHEN CHARINDEX('Orchard', DescriptiveTerm) > 0 THEN 17
  WHEN CHARINDEX('Coppice Or Osiers', DescriptiveTerm) > 0 THEN 18
  WHEN CHARINDEX('Scrub', DescriptiveTerm) > 0 THEN 19
  WHEN CHARINDEX('Boulders', DescriptiveTerm) > 0 OR CHARINDEX('Boulders (Scattered)', DescriptiveTerm) > 0 THEN 20
  WHEN CHARINDEX('Rock', DescriptiveTerm) > 0 OR CHARINDEX('Rock (Scattered)', DescriptiveTerm) > 0 THEN 21
  WHEN CHARINDEX('Scree', DescriptiveTerm) > 0 THEN 22
  WHEN CHARINDEX('Rough Grassland', DescriptiveTerm) > 0 THEN 23
  WHEN CHARINDEX('Heath', DescriptiveTerm) > 0 THEN 24
  WHEN CHARINDEX('Marsh Reeds Or Saltmarsh', DescriptiveTerm) > 0 OR CHARINDEX('Saltmarsh', DescriptiveTerm) > 0 THEN 25
  WHEN CHARINDEX('Sand', DescriptiveTerm) > 0 THEN 26
  WHEN CHARINDEX('Mud', DescriptiveTerm) > 0 THEN 27
  WHEN CHARINDEX('Shingle', DescriptiveTerm) > 0 THEN 28
  WHEN CHARINDEX('Marsh', DescriptiveTerm) > 0 THEN 29
  WHEN CHARINDEX('Reeds', DescriptiveTerm) > 0 THEN 30
  WHEN CHARINDEX('Foreshore', DescriptiveTerm) > 0 THEN 31
  WHEN DescriptiveTerm = 'Slope' THEN 32
  WHEN DescriptiveTerm = 'Cliff' THEN 33
  -- Descriptive Group Rules
  WHEN CHARINDEX('Building', DescriptiveGroup) > 0 THEN 34
  WHEN CHARINDEX('General Surface', DescriptiveGroup) > 0 AND Make = 'Natural' THEN 35
  WHEN CHARINDEX('General Surface', DescriptiveGroup) > 0 AND (Make = 'Manmade' OR Make = 'Unknown') THEN 36
  WHEN CHARINDEX('Road Or Track', DescriptiveGroup) > 0 AND Make = 'Manmade' THEN 37
  WHEN CHARINDEX('Roadside', DescriptiveGroup) > 0 AND Make = 'Natural' THEN 38
  WHEN CHARINDEX('Roadside', DescriptiveGroup) > 0 AND (Make = 'Manmade' OR Make = 'Unknown') THEN 39
  WHEN CHARINDEX('Inland Water', DescriptiveGroup) > 0 THEN 40
  WHEN CHARINDEX('Path', DescriptiveGroup) > 0 THEN 41
  WHEN CHARINDEX('Rail', DescriptiveGroup) > 0 AND (Make = 'Manmade' OR Make = 'Unknown') THEN 42
  WHEN CHARINDEX('Rail', DescriptiveGroup) > 0 AND Make = 'Natural' THEN 43
  WHEN CHARINDEX('Structure', DescriptiveGroup) > 0 THEN 44
  WHEN DescriptiveGroup = 'Glasshouse' THEN 45
  WHEN CHARINDEX('Landform', DescriptiveGroup) > 0 AND Make = 'Natural' THEN 46
  WHEN CHARINDEX('Tidal Water', DescriptiveGroup) > 0 THEN 47
  WHEN CHARINDEX('Landform', DescriptiveGroup) > 0 AND Make = 'Manmade' THEN 48
  ELSE 99
END;
