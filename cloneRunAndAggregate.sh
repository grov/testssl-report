git clone https://github.com/drwetter/testssl.sh.git
mkdir -p results
echo '"Application","id","fqdn/ip","port","severity","finding"' > results/fails.csv
while read url; do
    echo "./testssl.sh/testssl.sh --csvfile=results/$url $url" >> results/run.log
    ./testssl.sh/testssl.sh --csvfile=results/$url $url
    cd results
    ../aggregateFails.sh $url >> fails.csv
    echo "../aggregateFails.sh $url >> fails.csv" >> run.log
    cd -
done <urls.txt
