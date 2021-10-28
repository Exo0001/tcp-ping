import net
import time
import os
import term

const (
	red = "\033[31m"
	white = "\033[37m"
	colors = ["[38;2;255;0;255m", "[38;2;224;30;254m", "[38;2;193;60;253m", "[38;2;162;90;252m", "[38;2;131;120;251m", "[38;2;100;150;250m", "[38;2;69;180;249m", "[38;2;38;210;248m", "[38;2;69;180;249m", "[38;2;100;150;250m", "[38;2;131;120;251m", "[38;2;162;90;252m", "[38;2;193;60;253m", "[38;2;224;30;254m"]
)

fn main() {
	ip := os.args[1] or {
		term.clear()
		eprintln("Missing args! ./ping <ip> <port>")
		return
	}
	port := os.args[2].int() or {
		term.clear()
		eprintln("Missing args! | ./ping <ip> <port>")
		return
	}
	term.clear()
	print("${white}Probing ${ip} On Port ${port}\n\n")
	for {
		for color in colors {
			net.dial_tcp("${ip}:${port}") or {
			eprintln("${red}Connection Timed Out On ${ip}:${port}${white}")
			continue
			}
			print("${white}[${color}Connected To ${ip} On Port ${port}${white}]\n")
			time.sleep(1 * time.second)
		}
	}
}
