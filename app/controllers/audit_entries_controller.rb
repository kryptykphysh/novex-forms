class AuditEntriesController < ApplicationController
  before_action :set_audit_entry, only: %i[show edit update destroy]

  # GET /audit_entries or /audit_entries.json
  def index
    @audit_entry = AuditEntry.new
    @audit_entries = AuditEntry.all.order(created_at: :desc).limit(10)
  end

  # GET /audit_entries/1 or /audit_entries/1.json
  def show
  end

  # GET /audit_entries/new
  def new
    @audit_entry = AuditEntry.new
  end

  # GET /audit_entries/1/edit
  def edit
  end

  # POST /audit_entries or /audit_entries.json
  def create
    @audit_entry = AuditEntry.new(audit_entry_params.slice(:user, :resource))
    @audit_entry.old_data = JSON.parse(audit_entry_params[:old_data]) unless audit_entry_params[:old_data].blank?
    @audit_entry.new_data = JSON.parse(audit_entry_params[:new_data]) unless audit_entry_params[:new_data].blank?

    respond_to do |format|
      if @audit_entry.save
        format.html { redirect_to audit_entries_path, notice: "Audit entry was successfully created." }
        format.json { render :show, status: :created, location: @audit_entry }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@audit_entry, partial: "audit_entries/form", locals: {audit_entry: @audit_entry}) }
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @audit_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /audit_entries/1 or /audit_entries/1.json
  def update
    respond_to do |format|
      if @audit_entry.update(audit_entry_params)
        format.html { redirect_to @audit_entry, notice: "Audit entry was successfully updated." }
        format.json { render :show, status: :ok, location: @audit_entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @audit_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /audit_entries/1 or /audit_entries/1.json
  def destroy
    @audit_entry.destroy
    respond_to do |format|
      format.html { redirect_to audit_entries_url, notice: "Audit entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_audit_entry
    @audit_entry = AuditEntry.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def audit_entry_params
    params.require(:audit_entry).permit(:user, :resource, :old_data, :new_data)
  end
end
