class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  # GET /employee/1/account
  
  def index
    @employee = Employee.find(params[:employee_id])
    @account = @employee.account 
  end


  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @employee = Employee.find(params[:employee_id]) 
    @account = @employee.account 
  end

  # GET /employees/1/accounts/new 
  def new
    @employee = Employee.find(params[:employee_id])
    @account = @employee.build_account() 
  end
  


  # GET /accounts/1/edit
  # GET /customers/1/accounts/2/edit 
  def edit
    @employee = Employee.find(params[:employee_id])
    # the customer has only one account, therefore we directly # retrieve his account 
    @account = @employee.account 
  end
  
  # PATCH/PUT /customers/1/accounts/2 
  def update 
    @employee = Employee.find(params[:employee_id]) 
    @account = @employee.account 
    respond_to do |format| 
      if @account.update(account_params)
        format.html { redirect_to employee_account_url(@employee, @account),
        notice: 'Account was successfully updated.' } 
        format.json { render :show, status: :ok, location: @account } 
        else 
          format.html { render :edit } 
          format.json { render json: @account.errors, 
          status: :unprocessable_entity } 
      end
    end
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @employee = Employee.find(params[:employee_id]) 
    @account = @employee.build_account(account_params)


    respond_to do |format|
      if @account.save
       format.html { redirect_to employee_account_url(@employee, @account), notice: 'Account was successfully created.' }
       format.json { render :show, status: :created, location: @account } 
       else
         format.html { render :new } 
         format.json { render json: @account.errors, status: :unprocessable_entity } 
      end
    end
  end
  
 
  

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  # DELETE /blogs/1/posts/2 
  def destroy 
    @employee = Employee.find(params[:employee_id])
    
    # the employee has only one account, therefore 
    # we directly retrieve his account 
    @account = @employee.account 
    @account.destroy 
    respond_to do |format| 
      format.html { redirect_to employee_accounts_url(@employee), 
        notice: 'Account was successfully destroyed.' } 
      format.json { head :no_content } 
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:address1, :address2, :comments, :details, :employee)
    end
end
