class CommentsController < ApplicationController
    before_action :autorizar_admin, only: [:destroy]

    def new
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build
    end
    
    def create
      @comment = Comment.new(comment_params)
      
      if @comment.save
        redirect_to @comment.post, notice: "Comentario creado exitosamente"
      else
        render :new
      end
    end
      
    def destroy
      @comment = Comment.find(params[:id])
      @post = @comment.post
  
      if @comment.destroy
        redirect_to @post, notice: 'El comentario se eliminó exitosamente.'
      else
        redirect_to @post, notice: 'Hubo un error al eliminar el comentario.'
      end
    end
      
    private

    def autorizar_admin   #metodo de redireccion en caso de que usuario x intente ingresar
      redirect_to root_path, notice: "Acceso no autorizado" unless current_user.admin?
    end
  
    def comment_params
        params.require(:comment).permit(:contenido, :user_id, :post_id)
    end
end
      

