function on_msg_receive (msg)
    init();
    corpo = msg.text
    corpo = corpo:upper()
	chiave = {}
	
    if msg.out then
        return
    end

    if string.starts(corpo, "CHIAVE:") then
        splitta(corpo)
        if #tokens[2] ~= 3 then
        	testo = "La chiave dev'essere composta da tre caratteri."
        else
        	for i = 1, #tokens[2] do
        		chiave[i] = tokens[2]:sub(i,i)
        	end
        	testo = "Ricevuto messaggio idoneo alla codifica con la seguente chiave: "..chiave[1].."-"..chiave[2].."-"..chiave[3];
        	rotate(alfabeto, 3)
        	for i = 1, #alfabeto do
        		print (alfabeto[i])
        	end
        end
    else
        testo = "Ciao "..msg.from.print_name..", il messaggio che mi hai appena scritto non comprende una chiave di codifica, o non è scritta nel formato corretto. "..
        "Ti ricordo che il messaggio deve iniziare con \"chiave:\".";
    end
    --[[testo = "Ciao "..msg.from.print_name..", hai appena mandato un messaggio "..
    "con scritto '"..corpo.."'."
    testo = testo.." "..parole[1];]]
    send_msg (msg.from.print_name, testo, ok_cb, false)
end

function on_our_id (id)
end

function on_secret_chat_created (peer)
end

function on_user_update (user)
end

function on_chat_update (user)
end

function on_get_difference_end ()
end

function on_binlog_replay_end ()
end

function init()
    alfabeto = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" }
    terzo_rotore = { "B", "D", "F", "H", "J", "L", "C", "P", "R", "T", "X", "V", "Z", "N", "Y", "E", "I", "W", "G", "B", "K", "M", "U", "S", "Q", "O" }
    secondo_rotore = { "A", "J", "D", "K", "S", "I", "R", "U", "X", "B", "L", "H", "W", "T", "M", "C", "Q", "G", "Z", "N", "P", "Y", "F", "V", "O", "E" }
    primo_rotore = { "E", "K", "M", "F", "L", "G", "D", "Q", "V", "Z", "N", "T", "O", "W", "Y", "H", "X", "U", "S", "P", "A", "I", "B", "R", "C", "J" }
    riflettore = { "Y", "R", "U", "H", "Q", "S", "L", "D", "P", "X", "N", "G", "O", "K", "M", "I", "E", "B", "F", "Z", "C", "W", "V", "J", "A", "T" }
end

function string.starts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end

function splitta(stringa)
	tokens = {}
	for i in string.gmatch(stringa, "(%S+)") do
		tokens[#tokens+1] = i
	end
end

function rotate(array, n)
	carry = array[1]
	for j = 1, n do
		for i = 1, #array do
			array[i] = array[i+1]
		end
		array[#array] = carry
	end
	return array
end