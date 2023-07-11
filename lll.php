<?php
$discordToken = 'MTEyMDU1MTQyODM1MjY1MTMwNQ.GulAWk.YQdV7zVh8QspleM61tVjy9IXKpMo_RuvFkt_PQ'; // แทนที่ YOUR_DISCORD_TOKEN ด้วย Discord Token ของคุณ

// ส่วนของการเชื่อมต่อ Discord API
$discordApiUrl = 'https://discord.com/api/v9/users/@me';
$headers = [
    'Authorization: Bot ' . $discordToken,
    'Content-Type: application/json',
];

$curl = curl_init();
curl_setopt_array($curl, [
    CURLOPT_URL => $discordApiUrl,
    CURLOPT_HTTPHEADER => $headers,
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_FOLLOWLOCATION => true,
]);

$response = curl_exec($curl);
curl_close($curl);

if ($response) {
    $userData = json_decode($response, true);
    if ($userData && isset($userData['id'])) {
        $discordID = $userData['id'];
        echo 'Discord ID: ' . $discordID;
    } else {
        echo 'Failed to retrieve Discord ID.';
    }
} else {
    echo 'Failed to connect to Discord API.';
}
?>
