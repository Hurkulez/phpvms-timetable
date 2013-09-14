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

class TimetableData extends CodonData   {

    public function get_schedules($offset) {
        $query = "SELECT * FROM ".TABLE_PREFIX."schedules
                    ORDER BY depicao ASC
                    LIMIT 30
                    OFFSET $offset";

        return DB::get_results($query);
    }
}