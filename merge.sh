# bvp_test
git merge bvp_test;
echo "merge bvp_test";
git pull origin bvp_release --rebase
echo "pull --rebase"
git push origin bvp_release
curl -I -X POST http://admin:1148dcaea8d606292d850f3d2a658b6555@jenkins.bvptw.org:8088/job/bvp_upgrade_web/build
