if [ -z "$1" ]
  then
  echo -e "\n No argument supplied. You did not specify a mapping file to load."
  exit 1
fi
INDEX=${1%.*}
ES_URL_BASE="http://localhost:9200/$INDEX"
echo -e "\nThis script will delete the index at $ES_URL_BASE and PUT the mapping file $1"

echo ""
read -p "Are you sure ? All data in index $INDEX will be lost?  (y or n)" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
  echo -e "\naborting"
  exit 1
fi

echo ""
read -p "Are you really really sure? (y or n)" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
  echo -e "\naborting"
  exit 1
fi

echo -e "\n\nDeleting index $INDEX"
curl -XDELETE "$ES_URL_BASE"

echo -e "\n\nPUTing mapping file $1 to index $INDEX"
curl -XPUT "$ES_URL_BASE" -d @$1 --header "Content-Type: application/json"

echo -e "\n\nFinished."