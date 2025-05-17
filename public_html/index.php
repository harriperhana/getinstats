<?php

require_once "inc/functions.php";

$map = $players = $groups = $teams = [];

foreach (glob("../scripts/getinstats/map/*") as $stat) {

    foreach (parse_ini_file("../scripts/getinstats/map/" . basename($stat)) as $key => $value) {

        $map[$key] = is_numeric($value) ? intval($value) : $value;

    }

}

$map["style"] = [
    "id" => $map["style"],
    "name" => get_style($map["style"])
];

foreach (glob("../scripts/getinstats/player/stat/*") as $stat) {

    $player = player2array($stat);

    if (!isset($_GET["include_inactive"]) && empty($player["active"])) continue;

    $players[] = $player;

}

$sort_by = $_GET["sort_by"] ?? "kills";
$sort_dir = $_GET["sort_dir"] ?? "desc";

usort($players, function ($a, $b) use ($sort_by, $sort_dir) {

    $result = $a[$sort_by] <=> $b[$sort_by];

    return $sort_dir === "desc" ? -$result : $result;

});

if (isset($_GET["group_teams"])) {

    foreach ($players as $player) {

        $groups[$player["team"]["id"]][] = $player;

    }

    $players = $groups;

}

foreach (glob("../scripts/getinstats/team/stat/*") as $stat) {

    $teams[] = team2array($stat);

}

header("Content-Type: application/json; charset=utf-8");
http_response_code(200);

print json_encode([
    "map" => $map,
    "players" => $players,
    "teams" => $teams
], JSON_PRETTY_PRINT);