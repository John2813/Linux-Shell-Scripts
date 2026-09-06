#output
printf "hello world!\n"

name="Alice"
age=20
printf "Hello %s\n" "$name"
printf "age: %d\n" $age

# width and alignment
printf "|%10s|\n|%-10s|\n" "right" "left"

# leading zeros
printf "Year: %04d\n" 23

#float-point precision
printf "Pi: %.2f\n" 3.14159

#muti-arguments
printf "%-10s %5d %8.2f\n" "Apple" 5 2.5 "Orange" 3 1.75


#table
# table head
printf "%-15s %10s %10s %10s\n" "Item" "Quantity" "Price" "Total"

# split line
printf "%-15s %10s %10s %10s\n" "---------------" "----------" "----------" "----------"

# data line
printf "%-15s %10d %10.2f %10.2f\n" "Notebook" 3 2.50 7.50
printf "%-15s %10d %10.2f %10.2f\n" "Pen" 5 1.20 6.00
printf "%-15s %10d %10.2f %10.2f\n" "Eraser" 2 0.50 1.00

# total
printf "%-15s %10s %10s %10.2f\n" "" "" "Total:" 14.50
