import net
import time
import os
import term

const (
	red = "\033[31m"
	white = "\033[37m"
)

fn main() {
	ip := os.args[1] or {
		eprintln("Invalid args! | ./ping <ip> <port> <amount>")
		return
	}
	port := os.args[2] or {
		eprintln("Invalid args! | ./ping <ip> <port> <amount>")
		return
	}
	requests := os.args[3] or {
		eprintln("Invalid args! | ./ping <ip> <port> <amount>")
		return
	}
	mut counter := 0
	mut failed := 0
	term.clear()
	print("Probing ${ip} On Port ${port} With ${requests} Requests\n\n")
	for {
		counter += 1
		net.dial_tcp("${ip}:${port}") or {
		eprintln("${red}Connection Timed Out On ${ip}:${port}${white}")
			time.sleep(1 * time.second)
			failed += 1
			continue
		}
		print("[Connected To ${ip} On Port ${port} Protocol TCP Count ${counter} Online]\n")
		time.sleep(1 * time.second)
		if counter == requests.int() {
			print("Stopping test | ${counter} requests sent, ${failed} failed to connect!\n")
			return
		}
	}
}
