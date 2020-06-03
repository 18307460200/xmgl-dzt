

(function ($) {

    function findParent(node, selector) {
        return $(node).closest(selector)[0];
    }

    var NodeID = 1;


    var NavTree = function (element, options) {
        var me = this;
        me.element = $(element);
        me.options = $.extend(true, {}, me.options, options);
        me.init();
    }

    NavTree.prototype = {

        options: {
            //mode: "default",        //default, small
            data: null,
            click: null
        },

        init: function () {
            var me = this,
                el = me.element,
                opt = me.options,
                data = opt.data || [];

            var html = me.createTree(data);

            el.html(html);
            el.addClass("navtree");

            el.bind("click", $.proxy(me.onClick, me));

        },

        createTree: function (data) {

            var sb = [];

            var map = this.nodeMap = {};

            function createNode(node, level) {
                //{ text, img, children }

                if (!node._id) node._id = "navtree_node_" + NodeID++;
                map[node._id] = node;

                //node
                sb[sb.length] = '<div class="navtree-node">';

                var style = "";
                if (level > 0) {
                    var paddingLeft = level * 18;
                    style = "padding-left:" + paddingLeft + "px";
                }

                //node-title
                sb[sb.length] = '<div id="';
                sb[sb.length] = node._id;
                sb[sb.length] = '"  class="navtree-node-title ';
                if (node.children) {
                    sb[sb.length] = 'navtree-node-haschild ';
                }
                sb[sb.length] = 'navtree-node-level' + level;
                sb[sb.length] = '" style="';
                sb[sb.length] = style;
                sb[sb.length] = '">'
                if (node.img) {
                    sb[sb.length] = '<img class="navtree-node-img" src="';
                    sb[sb.length] = node.img;
                    sb[sb.length] = '" />';
                }
                sb[sb.length] = '<div class="navtree-node-text"><i class="navtree-node-icon"></i>'
                sb[sb.length] = node.text;
                sb[sb.length] = '</div>';

                //allow
                if (node.children) {
                    sb[sb.length] = '<div class="navtree-node-arrow"></div>';
                }
                sb[sb.length] = '</div>';

                //nodes
                if (node.children) {
                    createNodes(node.children, level + 1);
                }

                sb[sb.length] = '</div>';
            }

            function createNodes(nodes, level) {

                sb[sb.length] = '<div class="navtree-nodes">';
                for (var i = 0, l = nodes.length; i < l; i++) {
                    createNode(nodes[i], level);
                }
                sb[sb.length] = '</div>';
            }

            createNodes(data, 0);


            return sb.join('');
        },

        getNodeFromEvent: function (event) {
            var target = findParent(event.target, ".navtree-node-title");
            if (!target) return null;
            var id = target.id;
            var node = this.nodeMap[id];
            return node;
        },

        onClick: function (event) {
            var node = this.getNodeFromEvent(event);
            if (node) {
                if (node.children) {
                    this.toggleNode(node);
                } else {
                    this.selectNode(node);
                }
            }
            //alert(node);
        },

        expandNode: function (node) {
            node.expanded = true;
            var nodeEl = $("#" + node._id);
            nodeEl.parent().addClass("navtree-node-title-active");
            nodeEl.parent().children(".navtree-nodes").css("display", "block");
            nodeEl.parent().children(".navtree-nodes").slideDown();

        },
        collapseNode: function (node) {
            node.expanded = false;
            var nodeEl = $("#" + node._id);
            nodeEl.parent().removeClass("navtree-node-title-active");
            nodeEl.parent().children(".navtree-nodes").css("display", "none");
            nodeEl.parent().children(".navtree-nodes").slideUp();
        },
        toggleNode: function (node) {
            if (node.expanded === true) {
                this.collapseNode(node);
            } else {
                this.expandNode(node);
            }
        },
        selectNode: function (node) {
            $(".navtree-node-title", this.element).removeClass("navtree-node-selected");

            $("#" + node._id).addClass("navtree-node-selected");
			 if(this.options.selectNode){
				this.options.selectNode(node);
			}
        }

    };


    var widget = function (name, clazz) {
        $.fn[name] = function (options) {
            return this.each(function () {
                var widget = $.data(this, name);
                if (true) {
                    widget = new clazz(this, options);
                    $.data(this, name, widget);
                }
            });
        }
    }

    widget("navtree", NavTree);



})(jQuery);
