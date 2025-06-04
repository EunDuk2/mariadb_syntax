# 현재 working directory, staging area 상태 확인
git status

# .은 모든 수정/추가 사항 add
git add .
# 특정 파일만 add 할 경우 (경로까지 포함)
git add testfolder/test1.txt

# commit을 통해 메시지 타이틀과 메시지내용을 커밋이력으로 생성
git commit -m "메시지제목" -m "메시지내용"
# git commit만 입력하고 엔터시 vi모드 -> 첫 줄: 타이틀, 두번 째 줄부터 내용
git commit

# 커밋이력 확인
git log
git log --oneline
# head하단의 로그만 보이는 것이 아니라, 모든 commit이력을 조회
# head : 현재 checkout하고 있는 commitID를 의미
git log --all

# 원격 저장소로 업로드
git push origin 브랜치명
# 충돌 발생 시 충돌 무시하고 로컬 기준으로 원격에 덮어쓰기
git push origin 브랜치명 --force

# 특정 commit ID로의 전환
git checkout 커밋ID
# 특정 branch로의 전환
git checkout 브랜치명

# pull은 원격변경 사항을 local로 내려받는 것(fetch + merge)
git pull origin main

# fetch는 변경사항을 local로 가져오되, 병합은 하지 않는 것
git fetch origin main
# 만약 모든 브랜치의 변경사항을 가져오려면
git fetch --all
# 버전별(commit간) 비교 명령어
git diff A B
git diff commitID1 commitID2
git diff branch1 branch2

# 가장 최신의 커밋 취소
git reset head~1
git reset head^

# 이미 push된 commit사항 되돌리는(완전한 취소X) commitID생성
git revert 커밋ID

# 작업중인사항을 임시 저장
git stash
# 마지막으로 저장한 사항을 꺼내서 적용
git stash pop
# 저장한 작업목록 조회
git stash list
# 저장한 목록 전체 삭제
git stash clear



