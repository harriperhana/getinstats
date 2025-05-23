<?php

function player2array(string $file): array {

    $stats = parse_ini_file($file);

    $stats = array_diff_key($stats, array_flip(["ip", "hwid"]));

    $stats = array_map(function ($value) {

        return is_numeric($value) ? intval($value) : $value;

    }, $stats);

    $stats["team"] = [
        "id" => $stats["team"],
        "name" => get_team($stats["team"])
    ];

    $stats["primary"] = [
        "id" => $stats["primary"],
        "name" => get_weapon($stats["primary"]),
        "ammo" => $stats["ammo"]
    ];

    unset($stats["ammo"]);

    $stats["secondary"] = [
        "id" => $stats["secondary"],
        "name" => get_weapon($stats["secondary"]),
        "ammo" => $stats["secammo"]
    ];

    unset($stats["secammo"]);

    return $stats;

}

function team2array(string $file): array {

    $stats = parse_ini_file($file);

    $stats = array_map(function ($value) {

        return is_numeric($value) ? intval($value) : $value;

    }, $stats);

    $stats["name"] = get_team($stats["id"]);

    return $stats;

}

function map2array(string $file): array {

    return array_map(function ($value) {

        return is_numeric($value) ? intval($value) : $value;

    }, parse_ini_file($file));

}

function get_weapon(int $id): string {

    return [
        0 => "USSOCOM",
        1 => "Desert Eagles",
        2 => "HK MP5",
        3 => "Ak-74",
        4 => "Steyr AUG",
        5 => "Spas-12",
        6 => "Ruger 77",
        7 => "M79",
        8 => "Barrett M82A1",
        9 => "FN Minimi",
        10 => "XM214 Minigun",
        11 => "Flamer",
        14 => "Combat Knife",
        15 => "Chainsaw",
        16 => "M72 LAW",
        255 => "No weapon"
    ][$id] ?? "";

}

function get_team(int $id): string {

    return [
        1 => "Alpha Team",
        2 => "Bravo Team",
        3 => "Charlie Team",
        4 => "Delta Team",
        5 => "Spectator"
    ][$id] ?? "";

}

function get_style(int $id): string {

    return [
        0 => "Death Match",
        1 => "Point Match",
        2 => "Team Match",
        3 => "Capture the Flag",
        4 => "Rambo",
        5 => "Infiltration",
        6 => "Hold the Flag"
    ][$id] ?? "";

}