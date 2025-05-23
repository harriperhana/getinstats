<?php

require_once "inc/functions.php";

$players = $groups = $teams = [];

foreach (glob("../scripts/getinstats/data/player/*") as $stat) {

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

foreach (glob("../scripts/getinstats/data/team/*") as $stat) {

    $teams[] = team2array($stat);

}

$response = [
    "map" => map2array("../scripts/getinstats/data/map"),
    "players" => $players,
    "teams" => $teams
];

if (php_sapi_name() === "cli") {

    if ($argv[1] === "ruutupaneeli") {

        $response["module"] = "soldat";

    }

} else {

    header("Content-Type: application/json; charset=utf-8");
    http_response_code(200);

}

print json_encode($response, JSON_PRETTY_PRINT);