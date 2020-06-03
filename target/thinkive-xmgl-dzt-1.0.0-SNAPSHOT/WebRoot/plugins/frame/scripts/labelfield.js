/////////////////////////////////////////////////////////////////
mini.LabelField = function () {
    mini.LabelField.superclass.constructor.call(this);
    this._textEl.style.display = 'none';
    this.initComponents();
    this.bindEvents();
};
mini.extend(mini.LabelField, mini.TextArea, {
    uiCls: 'mini-labelfield',
    initComponents: function () {
    },
    bindEvents: function () {
    },
    getTargetEl: function () {
        return this._borderEl;
    },
    doLayout: function () {
        if (!this.canLayout()) return;
        mini.LabelField.superclass.doLayout.call(this);
        var h = mini.getHeight(this.el);
        if (!mini.isIE6) {
            mini.setHeight(this._borderEl, h);
        }
    }
});
mini.regClass(mini.LabelField, "LabelField");