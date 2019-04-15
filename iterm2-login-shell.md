set user ${user}
set host ${host}
set password ${password}

spawn ssh $user@$host
expect "*password:*"
send "$password\r"
interact
expect eof
