<?php
//simpilotgroup addon module for phpVMS virtual airline system
//
//simpilotgroup addon modules are licenced under the following license:
//Creative Commons Attribution Non-commercial Share Alike (by-nc-sa)
//To view full license text visit http://creativecommons.org/licenses/by-nc-sa/3.0/
//
//@author David Clark (simpilot)
//@copyright Copyright (c) 2009-2010, David Clark
//@license http://creativecommons.org/licenses/by-nc-sa/3.0/

$offset = 0;
$total = 1;
$page = 1;
while($offset < $numschedules) {
    ?>
<center>
    <h3><?php echo SITE_NAME; ?> Timetable</h3>
</center>
<table width="100%" frame="box">
    <tr align="center">
        <?php
            $count = 1;
            while($count <= 4) {
        ?>

        <td width="25%" valign="top">
            <table width="100%">
                <tr bgcolor="#cccccc">

                    <td>Arr</td>
                    <td>Flight</td>
                    <td>Type</td>
                    <td width="30%">Freq</td>
                    <td>Time</td>
                </tr>
        <?php
            $schedules = TimetableData::get_schedules($offset);
                        foreach($schedules as $schedule) {
                            if($departure <> $schedule->depicao) {
                                $field = OperationsData::getAirportInfo($schedule->depicao);
                                echo '<tr>';
                                echo '<td bgcolor="#cccccc" colspan="5"><b>'.$schedule->depicao.' - '.$field->name.'</b></td>';
                                echo '</tr>';
                            }
                            $departure = $schedule->depicao;
                            echo '<tr>';
                            echo '<td>'.$schedule->arricao.'</td>';
                            echo '<td>'.$schedule->flightnum.'</td>';
                            $aircraft = OperationsData::getAircraftInfo($schedule->aircraft);
                            echo '<td>'.$aircraft->icao.'</td>';
                            echo '<td>'.Util::GetDaysCompact($schedule->daysofweek).'</td>';
                            echo '<td>'.$schedule->deptime.'</td>';
                            echo '</tr>';
                            $total++;
                        }
                        $offset = $offset + 30;
         ?>
            </table>
        </td>
        <?php
            $count++;
                if($offset >= $numschedules) {
                    while($count <= 4) {
                        echo '<td width="25%" valign="top">
                                    <table width="100%">
                                    <tr bgcolor="#cccccc">
                                        <td>Arr</td>
                                        <td>Flight</td>
                                        <td>Type</td>
                                        <td width="30%">Freq</td>
                                        <td>Dur</td>
                                    </tr>
                                    </table>';
                        $count++;
                    }
                }
            }
        ?>
    </tr>
</table>
<center>
    <br />
    <h5>Page <?php echo $page;
            $page++; ?></h5>
</center>
<hr />
<br />
    <?php
}
        ?>
Total Flights: <?php echo $total; ?>
<br /><br />