# bvp_test
echo "commit" + $1;
git add .;
echo "added";
git ci -am "$1";
git pull origin bvp_test --rebase
echo "commit"
git push origin bvp_test
curl -I -X POST http://admin:4cfc90785b667885ba48a1f2e58afa6d@jenkins.test.congdongyte.vn:8088/job/bvp_upgrade_web_test/build
