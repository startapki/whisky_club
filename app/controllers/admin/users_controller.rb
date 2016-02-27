module Admin
  class UsersController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = User.all.paginate(10, params[:page])
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   User.find_by!(slug: param)
    # end

    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information
    def create
      resource = User.invite!(resource_params)

      if resource.save
        redirect_to [namespace, resource],
                    notice: translate_with_resource('create.success')
      else
        render :new, locals: {
          page: Administrate::Page::Form.new(dashboard, resource)
        }
      end
    end
  end
end
