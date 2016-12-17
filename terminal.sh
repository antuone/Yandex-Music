#Сохранить json метаданных этой музыки. Например с помощью curl'а.
#Далее json  переделываем в более удобочитаемый вид:
cat json | jq '.playlist.tracks[] | {"size":.fileSize,"title":.title,"artist":.artists[0].name,"cover":.artists[0].cover.uri,"genre":.albums[0].genre,"album":.albums[0].title,"year":.albums[0].year}' > json2
#Запускаем параллельно много копий скрипта изменяющего метаданные:
cat json2 | jq '.[]' | cut -d'"' -f2 | parallel -n7 --no-notice ./change.sh
