#! /usr/bash
# Change n

#nhop="2"
model="c2crs"
save_path="/root/autodl-fs/${model}/redial-dbpedia"

file1="dbpedia_subkg.json"
file2="entity2id.json"
file3="movie_ids.json"
data_path="$(pwd)/data/dataset/redial/nltk"
kg_path="$(pwd)/ali-kg/dbpedia-redial/${nhop}-hop"
tmp_path="$(pwd)/data"

# move n-hop files
mv "${data_path}/${file1}" "${tmp_path}"
mv "${data_path}/${file2}" "${tmp_path}"
mv "${data_path}/${file3}" "${tmp_path}"
cp "${kg_path}/${file1}" "${data_path}"
cp "${kg_path}/${file2}" "${data_path}"
cp "${kg_path}/${file3}" "${data_path}"

# create backup folders
mkdir -p log-backup/rec-train
mkdir -p log-backup/rec-eval
mkdir -p log-backup/conv-train
mkdir -p log-backup/conv-eval
mkdir -p model-backup

# run model
# recommendation
# train
. scripts/redial/train/redial_rec_train.sh
mv log/* log-backup/rec-train
mv "save/$(ls save)" "save/rec-train"
# evaluation
. scripts/redial/eval/redial_rec_eval.sh
mv log/* log-backup/rec-eval
mv save/rec-train model-backup
rm -r "save/$(ls save)"
mv model-backup/rec-train save

# conversation
# train
. scripts/redial/train/redial_conv_train.sh
mv log/* log-backup/conv-train
mv save/rec-train model-backup
mv "save/$(ls save)" "save/conv-train"
# evaluation
. scripts/redial/eval/redial_conv_eval.sh
mv log/* log-backup/conv-eval
mv save/conv-train model-backup

# backup
mkdir -p "${save_path}/${nhop}-hop/"
cp -R log-backup "${save_path}/${nhop}-hop/"
zip -r "redial-dbpedia-${nhop}hop-model.zip" model-backup
mv "redial-dbpedia-${nhop}hop-model.zip" "${save_path}/${nhop}-hop/"

# clean up
sh scripts/clean.sh
rm "${data_path}/${file1}"
rm "${data_path}/${file2}"
rm "${data_path}/${file3}"
mv "${tmp_path}/${file1}" "${data_path}"
mv "${tmp_path}/${file2}" "${data_path}"
mv "${tmp_path}/${file3}" "${data_path}"
