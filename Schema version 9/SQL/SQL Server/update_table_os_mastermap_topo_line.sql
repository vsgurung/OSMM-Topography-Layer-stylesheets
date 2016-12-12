UPDATE [dbo].[OS_MASTERMAP_TOPO_LINE] SET STYLE_DESCRIPTION =
CASE
  -- Descriptive Group Rules
  WHEN CHARINDEX('General Feature', DescriptiveGroup) > 0 AND DescriptiveTerm IS NULL AND PhysicalPresence = 'Obstructing' THEN 'Default Line'
  WHEN CHARINDEX('Building', DescriptiveGroup) > 0 AND DescriptiveTerm = 'Outline' AND PhysicalPresence = 'Obstructing' THEN 'Building Outline Line'
  WHEN CHARINDEX('General Feature', DescriptiveGroup) > 0 AND PhysicalPresence = 'Edge / Limit' THEN 'Edge Line'
  WHEN CHARINDEX('Road Or Track', DescriptiveGroup) > 0 THEN 'Road or Track Line'
  WHEN CHARINDEX('Building', DescriptiveGroup) > 0 AND DescriptiveTerm = 'Division' AND PhysicalPresence = 'Obstructing' THEN 'Building Division Line'
  WHEN CHARINDEX('Inland Water', DescriptiveGroup) > 0 THEN 'Inland Water Line'
  WHEN CHARINDEX('General Surface', DescriptiveGroup) > 0 AND Make = 'Natural' THEN 'General Surface Natural Line'
  WHEN CHARINDEX('Building', DescriptiveGroup) > 0 AND DescriptiveTerm = 'Outline' AND PhysicalPresence = 'Overhead' THEN 'Building Overhead Line'
  WHEN DescriptiveGroup = 'Landform' AND Make = 'Natural' THEN 'Landform Natural Line'
  WHEN DescriptiveGroup = 'Historic Interest' THEN 'Historic Interest Line'
  WHEN DescriptiveGroup = 'Landform' AND Make = 'Manmade' THEN 'Landform Manmade Line'
  -- Descriptive Term Rules
  WHEN CHARINDEX('Mean High Water (Springs)', DescriptiveTerm) > 0 THEN 'Mean High Water Line'
  WHEN CHARINDEX('Overhead Construction', DescriptiveTerm) > 0 THEN 'Overhead Construction Line'
  WHEN CHARINDEX('Line of Posts', DescriptiveTerm) > 0 THEN 'Line of Posts Line'
  WHEN CHARINDEX('Normal Tidal Limit', DescriptiveTerm) > 0 THEN 'Normal Tidal Limit Line'
  WHEN DescriptiveTerm = 'Polygon Closing Link' THEN 'Polygon Closing Line'
  WHEN DescriptiveTerm = 'Inferred Property Closing Link' THEN 'Property Closing Line'
  WHEN DescriptiveTerm = 'Bottom of Slope' THEN 'Bottom of Slope Line'
  WHEN DescriptiveTerm = 'Top of Slope' THEN 'Top of Slope Line'
  WHEN DescriptiveTerm = 'Step' THEN 'Step Line'
  WHEN DescriptiveTerm = 'Traffic Calming' THEN 'Traffic Calming Line'
  WHEN DescriptiveTerm = 'Standard Gauge Track' THEN 'Standard Gauge Track Line'
  WHEN DescriptiveTerm = 'Bottom Of Cliff' THEN 'Bottom Of Cliff Line'
  WHEN DescriptiveTerm = 'Top of Cliff' THEN 'Top Of Cliff Line'
  WHEN DescriptiveTerm = 'Mean Low Water (Springs)' THEN 'Mean Low Water Line'
  WHEN DescriptiveTerm = 'Unmade Path Alignment' THEN 'Path Line'
  WHEN DescriptiveTerm = 'Culvert' THEN 'Culvert Line'
  WHEN DescriptiveTerm = 'Pylon' THEN 'Pylon Line'
  WHEN DescriptiveTerm = 'Ridge Or Rock Line' THEN 'Ridge Or Rock Line'
  WHEN DescriptiveTerm = 'Narrow Gauge' THEN 'Narrow Gauge Line'
  WHEN DescriptiveTerm = 'Buffer' THEN 'Railway Buffer Line'
  WHEN DescriptiveTerm = 'Tunnel Edge' THEN 'Tunnel Edge Line'
  WHEN DescriptiveTerm = 'Drain' THEN 'Drain Line'
  ELSE 'Unclassified'
END,
STYLE_CODE =
CASE
  -- Descriptive Term Rules
  WHEN DescriptiveTerm = 'Polygon Closing Link' THEN 1
  WHEN DescriptiveTerm = 'Inferred Property Closing Link' THEN 2
  WHEN DescriptiveTerm = 'Bottom Of Slope' THEN 3
  WHEN DescriptiveTerm = 'Top Of Slope' THEN 4
  WHEN DescriptiveTerm = 'Step' THEN 5
  WHEN CHARINDEX('Mean High Water (Springs)', DescriptiveTerm) > 0 THEN 6
  WHEN DescriptiveTerm = 'Traffic Calming' THEN 7
  WHEN DescriptiveTerm = 'Standard Gauge Track' THEN 8
  WHEN DescriptiveTerm = 'Bottom Of Cliff' THEN 9
  WHEN DescriptiveTerm = 'Top Of Cliff' THEN 10
  WHEN DescriptiveTerm = 'Mean Low Water (Springs)' THEN 11
  WHEN DescriptiveTerm = 'Unmade Path Alignment' THEN 12
  WHEN CHARINDEX('Overhead Construction', DescriptiveTerm) > 0 THEN 13
  WHEN DescriptiveTerm = 'Culvert' THEN 14
  WHEN DescriptiveTerm = 'Pylon' THEN 15
  WHEN DescriptiveTerm = 'Ridge Or Rock Line' THEN 16
  WHEN DescriptiveTerm = 'Narrow Gauge' THEN 17
  WHEN DescriptiveTerm = 'Buffer' THEN 18
  WHEN DescriptiveTerm = 'Tunnel Edge' THEN 19
  WHEN CHARINDEX('Line Of Posts', DescriptiveTerm) > 0 THEN 20
  WHEN DescriptiveTerm = 'Drain' THEN 21
  WHEN CHARINDEX('Normal Tidal Limit', DescriptiveTerm) > 0 THEN 22
  -- Descriptive Group Rules
  WHEN CHARINDEX('General Feature', DescriptiveGroup) > 0 AND PhysicalPresence != 'Edge / Limit' THEN 23
  WHEN CHARINDEX('Building', DescriptiveGroup) > 0 AND DescriptiveTerm = 'Outline' AND PhysicalPresence = 'Obstructing' THEN 24
  WHEN CHARINDEX('General Feature', DescriptiveGroup) > 0 AND PhysicalPresence = 'Edge / Limit' THEN 25
  WHEN CHARINDEX('Road Or Track', DescriptiveGroup) > 0 THEN 26
  WHEN CHARINDEX('Building', DescriptiveGroup) > 0 AND DescriptiveTerm = 'Division' AND PhysicalPresence = 'Obstructing' THEN 27
  WHEN CHARINDEX('Inland Water', DescriptiveGroup) > 0 THEN 28
  WHEN CHARINDEX('General Surface', DescriptiveGroup) > 0 AND Make = 'Natural' THEN 29
  WHEN CHARINDEX('Building', DescriptiveGroup) > 0 AND DescriptiveTerm = 'Outline' AND PhysicalPresence = 'Overhead' THEN 30
  WHEN DescriptiveGroup = 'Historic Interest' THEN 32
  WHEN DescriptiveGroup = 'Landform' AND Make = 'Manmade' THEN 33
  ELSE 99
END;
