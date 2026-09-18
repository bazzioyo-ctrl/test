# LM Studio Bionic 대화 기록

이 저장소는 LM Studio Bionic에서 진행된 대화 내용을 Markdown 파일로 저장해 둔 것입니다.
다른 PC에서 이 저장소를 `git clone`하면 대화 기록을 볼 수 있습니다.

## 파일

- [conversation.md](conversation.md) — 대화 전체 기록 (사용자/어시스턴트 메시지, 도구 호출, 추론 과정 포함)
- [windows-auto-sync/](windows-auto-sync/) — Windows PC용 자동 동기화 스크립트

## Windows PC에서 자동 저장하기 (C:\apple_bazzi)

[Git for Windows](https://gitforwindows.org/) 가 설치되어 있어야 합니다.

**1) 폴더에 클론하기** (PowerShell에서 한 번만)

```powershell
git clone https://github.com/bazzioyo-ctrl/test.git C:\apple_bazzi
```

**2) 자동 동기화 등록하기** (한 번만)

```powershell
powershell -ExecutionPolicy Bypass -File C:\apple_bazzi\windows-auto-sync\setup-scheduled-task.ps1
```

이 후 Mac 쪽에서 "다시 내보내서 push해줘"라고 하면, 이 PC(Windows)의 `C:\apple_bazzi`에 **10분 안에 자동으로** 새 대화 기록이 저장됩니다.

**3) 수동으로 바로 업데이트하려면**

```powershell
C:\apple_bazzi\windows-auto-sync\auto-pull.bat
```

> 동기화 제거: `Unregister-ScheduledTask -TaskName BionicConversationSync -Confirm:$false`
