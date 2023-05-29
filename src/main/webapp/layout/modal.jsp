<%--
  Created by IntelliJ IDEA.
  User: joontae
  Date: 2023-05-29
  Time: 오후 1:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>
    $(document).ready(() => {
        $(".a-modal").on("click", function () {
            var data = $(this).data('id');
            var idx = $(this).data('idx');
            $("#post-mode").val(data);
            $("#input-idx").val(idx);
        });

        $(".btn-modal").on("click", function () {
            var data = $(this).data('id');
            var idx = $(this).data('idx');
            $("#post-mode").val(data);
            $("#input-idx").val(idx);
        });

        $("#form-modal").submit(() => {
            $("#modal-pass").modal('hide');
        });
    });
</script>

<div class="modal fade" id="modal-pass">
    <div class="modal-dialog modal-dialog-centered">
        <form class="modal-content" action="/myLog/Pass.do" method="post" id="form-modal">
            <div class="modal-header">
                <h4 class="modal-title">비밀번호 입력</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <label for="post-pass" class="form-label">비밀번호</label>
                <input type="password" class="form-control" id="post-pass" name="postPass"
                       placeholder="비밀번호를 입력하세요"
                       required>
            </div>
            <div>
                <input type="hidden" name="postIdx" id="input-idx">
                <input type="hidden" name="postMode" id="post-mode">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="submit" class="btn btn-primary">확인</button>
            </div>
        </form>
    </div>
</div>
</div>
