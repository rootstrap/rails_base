def create
  super
  cookies[:user_id] = current_user.id
end

def destroy
  super
  cookies.delete :user_id
end
