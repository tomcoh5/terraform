#!/bin/bash
# must have aws cli configured
function printimage(){
        image_id=$(aws ec2 describe-images --owners 'amazon' --filters "Name=description,Values=$1*" --query 'sort_by(Images, &CreationDate)[-1].[ImageId]' --output 'text')
        echo "$image_id"
}

list_of_images=(Amazon Ubuntu SUSU)
PS3='Please enter your choice: '
options=("Amazon Linux" "Ubuntu" "SUSU" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Amazon Linux")
            printimage "Amazon Linux"
            ;;
        "Ubuntu")
            echo "you chose choice ubuntu"
            printimage "Ubuntu"
            ;;
        "SUSU")
            printimage "SUSU"
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
