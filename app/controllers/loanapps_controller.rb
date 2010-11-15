class LoanappsController < ApplicationController
  # GET /loanapps
  # GET /loanapps.xml
  def index
    @loanapps = Loanapp.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @loanapps }
    end
  end

  # GET /loanapps/1
  # GET /loanapps/1.xml
  def show
    @loanapp = Loanapp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @loanapp }
    end
  end

  # GET /loanapps/new
  # GET /loanapps/new.xml
  def new
    @loanapp = Loanapp.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @loanapp }
    end
  end

  # GET /loanapps/1/edit
  def edit
    @loanapp = Loanapp.find(params[:id])
  end

  # POST /loanapps
  # POST /loanapps.xml
  def create
    @loanapp = Loanapp.new(params[:loanapp])

    respond_to do |format|
      if @loanapp.save
        flash[:notice] = 'Your Online Loan Application has been successfully submitted.'
		
		#send the loan application of the member to the credit union by email
		Emailer.deliver_loanapp_email(@loanapp)
		
        format.html { redirect_to(@loanapp) }
        format.xml  { render :xml => @loanapp, :status => :created, :location => @loanapp }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @loanapp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /loanapps/1
  # PUT /loanapps/1.xml
  def update
    @loanapp = Loanapp.find(params[:id])

    respond_to do |format|
      if @loanapp.update_attributes(params[:loanapp])
        flash[:notice] = 'Loanapp was successfully updated.'
        format.html { redirect_to(@loanapp) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @loanapp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /loanapps/1
  # DELETE /loanapps/1.xml
  def destroy
    @loanapp = Loanapp.find(params[:id])
    @loanapp.destroy

    respond_to do |format|
      format.html { redirect_to(loanapps_url) }
      format.xml  { head :ok }
    end
  end
end
