import net
import time
import os
import term

const (
	red = "\033[31m"
	white = "\033[37m"
	cyan = "\033[36m"
)

fn main() {
	ip := os.args[1]
	port := os.args[2].int()
	term.clear()
	print("${white}Probing ${ip} On Port ${port}\n\n")
	for {
		net.dial_tcp("${ip}:${port}") or {
			eprintln("${red}Connection Timed Out On ${ip}:${port}${white}")
			continue
		}
		print("${white}[${cyan}Connected To ${ip} On Port ${port}${white}]\n")
		time.sleep(1 * time.second)
	}
}