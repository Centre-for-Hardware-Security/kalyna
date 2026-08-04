database -open -shm -into waves.shm waves -default
probe -create -database waves -all -memories -depth all tb_ua_crypto.u_chip_top
run
exit
